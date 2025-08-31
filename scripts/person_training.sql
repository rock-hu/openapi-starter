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
-- Name: person_training; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE person_training (
    party_id character varying(20) NOT NULL,
    training_request_id character varying(20),
    training_class_type_id character varying(20) NOT NULL,
    work_effort_id character varying(20),
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    approver_id character varying(20),
    approval_status character varying(60),
    reason character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.person_training OWNER TO ofbiz;

--
-- Name: person_training pk_person_training; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY person_training
    ADD CONSTRAINT pk_person_training PRIMARY KEY (party_id, training_class_type_id, from_date);


--
-- Name: pers_trng_appr; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pers_trng_appr ON person_training USING btree (approver_id);


--
-- Name: pers_trng_prty; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pers_trng_prty ON person_training USING btree (party_id);


--
-- Name: pers_trng_tctp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pers_trng_tctp ON person_training USING btree (training_class_type_id);


--
-- Name: pers_trng_trnrq; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pers_trng_trnrq ON person_training USING btree (training_request_id);


--
-- Name: pers_trng_wref; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX pers_trng_wref ON person_training USING btree (work_effort_id);


--
-- Name: prsn_trnng_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prsn_trnng_txcrts ON person_training USING btree (created_tx_stamp);


--
-- Name: prsn_trnng_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX prsn_trnng_txstmp ON person_training USING btree (last_updated_tx_stamp);


--
-- Name: person_training pers_trng_appr; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY person_training
    ADD CONSTRAINT pers_trng_appr FOREIGN KEY (approver_id) REFERENCES person(party_id);


--
-- Name: person_training pers_trng_prty; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY person_training
    ADD CONSTRAINT pers_trng_prty FOREIGN KEY (party_id) REFERENCES party(party_id);


--
-- Name: person_training pers_trng_tctp; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY person_training
    ADD CONSTRAINT pers_trng_tctp FOREIGN KEY (training_class_type_id) REFERENCES training_class_type(training_class_type_id);


--
-- Name: person_training pers_trng_trnrq; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY person_training
    ADD CONSTRAINT pers_trng_trnrq FOREIGN KEY (training_request_id) REFERENCES training_request(training_request_id);


--
-- Name: person_training pers_trng_wref; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY person_training
    ADD CONSTRAINT pers_trng_wref FOREIGN KEY (work_effort_id) REFERENCES work_effort(work_effort_id);


--
-- PostgreSQL database dump complete
--

