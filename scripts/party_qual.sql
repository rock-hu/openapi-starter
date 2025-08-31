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
-- Name: party_qual; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE party_qual (
    party_id character varying(20) NOT NULL,
    party_qual_type_id character varying(20) NOT NULL,
    qualification_desc character varying(60),
    title character varying(60),
    status_id character varying(20),
    verif_status_id character varying(20),
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.party_qual OWNER TO ofbiz;

--
-- Name: party_qual pk_party_qual; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_qual
    ADD CONSTRAINT pk_party_qual PRIMARY KEY (party_id, party_qual_type_id, from_date);


--
-- Name: party_qual_pqtyp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_qual_pqtyp ON party_qual USING btree (party_qual_type_id);


--
-- Name: party_qual_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_qual_prty ON party_qual USING btree (party_id);


--
-- Name: party_qual_status; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_qual_status ON party_qual USING btree (status_id);


--
-- Name: party_qual_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_qual_txcrts ON party_qual USING btree (created_tx_stamp);


--
-- Name: party_qual_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_qual_txstmp ON party_qual USING btree (last_updated_tx_stamp);


--
-- Name: party_qual_verif; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX party_qual_verif ON party_qual USING btree (verif_status_id);


--
-- Name: party_qual party_qual_pqtyp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_qual
    ADD CONSTRAINT party_qual_pqtyp FOREIGN KEY (party_qual_type_id) REFERENCES party_qual_type(party_qual_type_id);


--
-- Name: party_qual party_qual_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_qual
    ADD CONSTRAINT party_qual_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: party_qual party_qual_status; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_qual
    ADD CONSTRAINT party_qual_status FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- Name: party_qual party_qual_verif; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY party_qual
    ADD CONSTRAINT party_qual_verif FOREIGN KEY (verif_status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

