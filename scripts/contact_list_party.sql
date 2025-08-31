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
-- Name: contact_list_party; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE contact_list_party (
    contact_list_id character varying(20) NOT NULL,
    party_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    status_id character varying(20),
    preferred_contact_mech_id character varying(20),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.contact_list_party OWNER TO ofbiz;

--
-- Name: contact_list_party pk_contact_list_party; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_party
    ADD CONSTRAINT pk_contact_list_party PRIMARY KEY (contact_list_id, party_id, from_date);


--
-- Name: cnct_lstpty_clst; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lstpty_clst ON contact_list_party USING btree (contact_list_id);


--
-- Name: cnct_lstpty_pcm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lstpty_pcm ON contact_list_party USING btree (preferred_contact_mech_id);


--
-- Name: cnct_lstpty_pty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lstpty_pty ON contact_list_party USING btree (party_id);


--
-- Name: cnct_lstpty_sts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cnct_lstpty_sts ON contact_list_party USING btree (status_id);


--
-- Name: cntt_lst_prt_txcrs; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_lst_prt_txcrs ON contact_list_party USING btree (created_tx_stamp);


--
-- Name: cntt_lst_prt_txstp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX cntt_lst_prt_txstp ON contact_list_party USING btree (last_updated_tx_stamp);


--
-- Name: contact_list_party cnct_lstpty_clst; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_party
    ADD CONSTRAINT cnct_lstpty_clst FOREIGN KEY (contact_list_id) REFERENCES contact_list(contact_list_id);


--
-- Name: contact_list_party cnct_lstpty_pcm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_party
    ADD CONSTRAINT cnct_lstpty_pcm FOREIGN KEY (preferred_contact_mech_id) REFERENCES contact_mech(contact_mech_id);


--
-- Name: contact_list_party cnct_lstpty_pty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_party
    ADD CONSTRAINT cnct_lstpty_pty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: contact_list_party cnct_lstpty_sts; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY contact_list_party
    ADD CONSTRAINT cnct_lstpty_sts FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

