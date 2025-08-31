--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: party; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party (
    party_id character varying(20) NOT NULL,
    party_type_id character varying(20),
    external_id character varying(20),
    preferred_currency_uom_id character varying(20),
    description text,
    status_id character varying(20),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    data_source_id character varying(20),
    is_unread character(1),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party OWNER TO ofbiz;

--
-- Name: party pk_party; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party
    ADD CONSTRAINT pk_party PRIMARY KEY (party_id);


--
-- Name: party_cul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_cul ON party USING btree (created_by_user_login);


--
-- Name: party_datsrc; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_datsrc ON party USING btree (data_source_id);


--
-- Name: party_lmcul; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_lmcul ON party USING btree (last_modified_by_user_login);


--
-- Name: party_pref_crncy; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_pref_crncy ON party USING btree (preferred_currency_uom_id);


--
-- Name: party_pty_typ; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_pty_typ ON party USING btree (party_type_id);


--
-- Name: party_statusitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_statusitm ON party USING btree (status_id);


--
-- Name: party_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_txcrts ON party USING btree (created_tx_stamp);


--
-- Name: party_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_txstmp ON party USING btree (last_updated_tx_stamp);


--
-- Name: partyext_id_idx; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX partyext_id_idx ON party USING btree (external_id);


--
-- Name: party party_cul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party
    ADD CONSTRAINT party_cul FOREIGN KEY (created_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: party party_datsrc; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party
    ADD CONSTRAINT party_datsrc FOREIGN KEY (data_source_id) REFERENCES data_source(data_source_id);


--
-- Name: party party_lmcul; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party
    ADD CONSTRAINT party_lmcul FOREIGN KEY (last_modified_by_user_login) REFERENCES user_login(user_login_id);


--
-- Name: party party_pref_crncy; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party
    ADD CONSTRAINT party_pref_crncy FOREIGN KEY (preferred_currency_uom_id) REFERENCES uom(uom_id);


--
-- Name: party party_pty_typ; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party
    ADD CONSTRAINT party_pty_typ FOREIGN KEY (party_type_id) REFERENCES party_type(party_type_id);


--
-- Name: party party_statusitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party
    ADD CONSTRAINT party_statusitm FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

